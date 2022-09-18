env          = "dev"
region       = "us-east-2"
profile      = "akashambadi"
vpc_cidr     = "10.3.0.0/16"
sub_pub_cidr = ["10.3.1.0/28"]
# "10.3.2.0/28"]
sub_pub_AZ = ["us-east-2a"]
#"us-east-2b"]
sub_pvt_cidr = ["10.3.10.0/28", "10.3.20.0/28"]
sub_pvt_AZ   = ["us-east-2c", "us-east-2a"]
#image         = "ami-0568773882d492fc8"
instance_type = "t2.micro"
key_name      = "9AMsg"
amis = {
  "us-east-2" = "ami-0568773882d492fc8"
  "us-west-1" = "ami-018d291ca9ffc002f"
}
