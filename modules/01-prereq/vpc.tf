resource "aws_vpc" "main-vpc" {
    #TODO: UPDATE WITH VAR INSTEAD OF HARDCODED
	# checkov:skip=BC_AWS_NETWORKING_4: ADD REASON
	# checkov:skip=BC_AWS_LOGGING_9: ADD REASON
  cidr_block = "10.0.0.0/16"
}