provider "aws" {
  region  = var.region
  version = ">= 2.7"
}

resource "aws_dynamodb_table" "reminders" {
  name = var.table_name
  read_capacity = 5
  write_capacity = 5
  hash_key = var.hash_key

  attribute {
      name = var.hash_key
      type = "S"
  }
  
  tags = {
      Application = "Recall"
  }
}
