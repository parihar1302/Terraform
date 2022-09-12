##Providers.tf :- it represent service provider like aws, azure, gcp & etc on which terraform will work.

## Note:- you can even mention either in main.tf file.

#Syntex:-
provider "aws" {
  region     = "eu-central-1"
  access_key = "XXXXXXXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
} 

=============================================================================================================
