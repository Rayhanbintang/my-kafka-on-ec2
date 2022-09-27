resource "aws_msk_cluster" "my-msk" {
	# checkov:skip=BC_AWS_GENERAL_32: dev
	# checkov:skip=BC_AWS_LOGGING_18: dev
  cluster_name           = "my-msk"
  kafka_version          = "2.8.0"
  number_of_broker_nodes = 2

  broker_node_group_info {
    instance_type = "kafka.t3.small"
    client_subnets = [
      data.aws_subnet.subnet-private1.id,
      data.aws_subnet.subnet-private2.id,
    ]
    storage_info {
      ebs_storage_info {
        volume_size = 20
      }
    }
    security_groups = [aws_security_group.msk_sg.id]
  }

#   encryption_info {
#     encryption_at_rest_kms_key_arn = aws_kms_key.kms.arn
#   }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = false
      }
      node_exporter {
        enabled_in_broker = false
      }
    }
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = false
        # log_group = aws_cloudwatch_log_group.test.name
      }
      firehose {
        enabled         = false
        # delivery_stream = aws_kinesis_firehose_delivery_stream.test_stream.name
      }
      s3 {
        enabled = false
        # bucket  = aws_s3_bucket.bucket.id
        # prefix  = "logs/msk-"
      }
    }
  }

#   tags = {
#     foo = "bar"
#   }
}

output "zookeeper_connect_string" {
  value = aws_msk_cluster.example.zookeeper_connect_string
}

output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = aws_msk_cluster.example.bootstrap_brokers_tls
}

resource "aws_security_group" "msk_sg" {
	# checkov:skip=BC_AWS_NETWORKING_67: dev
	# checkov:skip=BC_AWS_NETWORKING_2: dev
	# checkov:skip=BC_AWS_NETWORKING_1: dev
	# checkov:skip=BC_AWS_NETWORKING_31: dev
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}