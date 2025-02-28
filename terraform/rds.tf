resource "aws_db_instance" "mysql" {
  engine            = "mysql"
  allocated_storage = 20
  instance_class    = "db.t3.micro"
  username         = "admin"
  password         = "Aditya123"
  skip_final_snapshot = true
  publicly_accessible = false
  db_subnet_group_name = aws_db_subnet_group.db_group.name
}

resource "aws_db_subnet_group" "db_group" {
  name       = "main-db-group"
  subnet_ids = ["subnet-03627fadc108b9b67", "subnet-0c6a09673189d357b"]  # us-east-1e & us-east-1f

  tags = {
    Name = "Main DB Subnet Group"
  }
}
