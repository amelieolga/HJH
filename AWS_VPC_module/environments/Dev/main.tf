module "vpc_module" {
  source = "../.."

  environment          = "dev"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  instance_type       = "t2.micro"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
  region              = "us-east-1"
  
  additional_ec2_policies = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" # Example additional policy
  ]
  enable_cloudwatch_logging = true
}