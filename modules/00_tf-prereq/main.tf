data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "tf_state" {
  bucket = format("%s-%s-%s-%s", local.general_prefix, "tfstate", data.aws_region.current.name, data.aws_caller_identity.current.account_id)
  
  tags = merge(
    var.tags,
    var.s3_tags
  )
}

resource "aws_s3_bucket_public_access_block" "tf_state" {
  bucket                  = aws_s3_bucket.tf_state.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
  depends_on = [
    aws_s3_bucket.tf_state
  ]
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  #checkov:skip=CKV_AWS_28:Only used for lock file. No need for PITR
  #checkov:skip=CKV_AWS_119:Only used for lock file. No need for autoscaling
  #checkov:skip=CKV2_AWS_16:Only used for lock file. No need for encryption
  name           = format("%s-tf-state-lock", local.general_prefix)
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = merge(
    var.tags,
    var.dynamodb_tags
  )
}
