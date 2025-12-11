#configure my s3 bucket so i can store my state file and enable dynamodb locking
terraform {
  backend "s3" {
    bucket = "terraform-state-jawwad"
    key    = "terraform.tfstate"
    region = "eu-west-2"
    # for dynamodb state locking ,we use  LockId in partition key
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}

#lol, first time when I done it ^ I made them all variables, but variables weren't allowed 