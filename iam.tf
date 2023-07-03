resource "aws_iam_role" "ecs_task_role" {
  name = "test-ecsTaskRole"
 
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "ecs-tasks.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

data "aws_iam_policy_document" "ecs_policy_document" {
  statement {
    effect  = "Allow"
    actions = ["ecs:CreateCluster", "ecs:ListClusters", "ecs:DescribeClusters", "ecs:DeleteCluster"]
    resources = ["arn:aws:ecs:region:account-id:cluster/*"]
  }

  statement {
    effect  = "Allow"
    actions = ["ecs:RegisterTaskDefinition", "ecs:DeregisterTaskDefinition", "ecs:DescribeTaskDefinition", "ecs:ListTaskDefinitions"]
    resources = ["*"]
  }

  statement {
    effect  = "Allow"
    actions = ["ecs:RunTask", "ecs:StartTask", "ecs:StopTask", "ecs:DescribeTasks", "ecs:ListTasks"]
    resources = ["*"]
  }

  statement {
    effect  = "Allow"
    actions = ["ecs:SubmitContainerStateChange", "ecs:SubmitTaskStateChange"]
    resources = ["*"]
  }

  statement {
    effect  = "Allow"
    actions = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
    resources = ["arn:aws:logs:region:account-id:log-group:/aws/ecs/*"]
  }

  statement {
    effect  = "Allow"
    actions = ["ecr:GetAuthorizationToken", "ecr:BatchCheckLayerAvailability", "ecr:GetDownloadUrlForLayer", "ecr:BatchGetImage", "ecr:InitiateLayerUpload", "ecr:UploadLayerPart", "ecr:CompleteLayerUpload", "ecr:PutImage"]
    resources = ["*"]
  }
}


resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = data.aws_iam_policy_document.ecs_policy_document.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.policy.arn
}