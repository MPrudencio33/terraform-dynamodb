resource "aws_dynamodb_table" "marlon-bookinventory" {
  name           = "marlon-bookinventory"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ISBN"
  range_key      = "Genre"
  table_class    = "STANDARD"

  attribute {
    name = "ISBN"
    type = "S"
  }

  attribute {
    name = "Genre"
    type = "S"
  }

  attribute {
    name = "Title"
    type = "S"
  }

  attribute {
    name = "Author"
    type = "S"
  }
  
  attribute {
    name = "Stock"
    type = "N"
  }
  
  # Define Global Secondary Index (GSI)
  global_secondary_index {
    name               = "TitleIndex"
    hash_key           = "Title"
    projection_type    = "ALL"  # This includes all attributes in the index
  }

  global_secondary_index {
    name               = "AuthorIndex"
    hash_key           = "Author"
    projection_type    = "ALL"  # This includes all attributes in the index
  }
  global_secondary_index {
    name               = "StockIndex"
    hash_key           = "Stock"
    projection_type    = "ALL"  # This includes all attributes in the index
  }
  
  tags = {
        Name        = "marlon-bookinventory"
        Environment = "dev"
    }
  }