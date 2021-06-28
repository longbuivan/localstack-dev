resource "aws_dynamodb_table" "dim-table" {
  name           = "table_d"
  read_capacity  = "20"
  write_capacity = "20"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}