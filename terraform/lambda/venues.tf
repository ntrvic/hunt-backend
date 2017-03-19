module "venues_lambda"{
  source = "./modules/lambda"

  name = "venues"
  runtime = "python2.7"
  role    = "${aws_iam_role.default_lambda.arn}"
  handler = "lambda_handler"
}

resource "aws_api_gateway_rest_api" "venues_api" {
  name = "Venues API"
}

resource "aws_api_gateway_resource" "venues_api_resource" {
  rest_api_id = "${aws_api_gateway_rest_api.venues_api.id}"
  parent_id   = "${aws_api_gateway_rest_api.venues_api.root_resource_id}"
  path_part   = "list"
}

module "venues_get" {
  source      = "./modules/api_method"
  rest_api_id = "${aws_api_gateway_rest_api.venues_api.id}"
  resource_id = "${aws_api_gateway_resource.venues_api_resource.id}"
  method      = "GET"
  path        = "${aws_api_gateway_resource.venues_api_resource.path}"
  lambda      = "${module.venues_lambda.name}"
  region      = "${var.region}"
  account_id  = "${var.account}"
}

resource "aws_api_gateway_deployment" "venues_api_deployment" {
  rest_api_id = "${aws_api_gateway_rest_api.venues_api.id}"
  stage_name  = "development"
  description = "Deploy methods: ${module.venues_get.http_method}"
}
