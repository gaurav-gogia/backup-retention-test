terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

}

provider "aws" {
  region = "us-east-1"
}


resource "aws_db_instance" "rds_instance" {
  allocated_storage       = 20
  backup_retention_period = 30
  identifier              = "rds-terraform"
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0.27"
  instance_class          = "db.t2.micro"
  name                    = "testing_db"
  username                = "fpiquette"
  password                = "=Derf1971!"
  publicly_accessible     = false
  skip_final_snapshot     = true


  tags = {
    Name = "ExampleRDSServerInstance"
  }
}


resource "aws_db_instance" "rds_no_backup" {
  allocated_storage       = 20
  backup_retention_period = 0
  identifier              = "rds-terraform"
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0.27"
  instance_class          = "db.t2.micro"
  name                    = "testing_db"
  username                = "fpiquette"
  password                = "=Derf1971!"
  publicly_accessible     = false
  skip_final_snapshot     = true


  tags = {
    Name = "ExampleRDSServerInstance"
  }
}
