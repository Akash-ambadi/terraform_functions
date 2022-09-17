region        = "us-east-2"
cidr_block    = "10.25.0.0/16"
sub_pub_cidr  = ["10.25.1.0/28", "10.25.2.0/28", "10.25.3.0/28"]
sub_pub_AZ    = ["us-east-2a", "us-east-2b", "us-east-2c"]
sub_pvt_cidr  = ["10.25.10.0/28", "10.25.20.0/28", "10.25.30.0/28"]
image         = "ami-0568773882d492fc8"
instance_type = "t2.micro"
key_name      = "9AMsg"
