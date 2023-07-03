
# resource "aws_api_gateway_rest_api" "api_Ns" {
#   name        = "api_Ns-api"
#   description = "An API Gateway"
# }

# resource "aws_api_gateway_resource" "api_resources" {
#   rest_api_id = aws_api_gateway_rest_api.api_Ns.id
#   parent_id   = aws_api_gateway_rest_api.api_Ns.root_resource_id
#   path_part   = "example"
# }

# resource "aws_api_gateway_method" "api_method" {
#   rest_api_id   = aws_api_gateway_rest_api.api_Ns.id
#   resource_id   = aws_api_gateway_resource.api_resources.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "api_integrate" {
#   rest_api_id             = aws_api_gateway_rest_api.api_Ns.id
#   resource_id             = aws_api_gateway_resource.api_resources.id
#   http_method             = aws_api_gateway_method.api_method.http_method
#   integration_http_method = "GET"
#   type                    = "HTTP"
#   uri                     = "http://example.com"
# }

# resource "aws_api_gateway_deployment" "api_deployment" {
#   rest_api_id = aws_api_gateway_rest_api.api_Ns.id
#   stage_name  = "prod"
# }
