## Terraform Output:- it containts output values of terraform code. Useful to troubleshoot error.

## Note:- you might end up on error while using count parameter. kindly remove or comment out'#'. because terraform will get confused which server's value to show.

#Syntex:-
output "my_console_output" {                                     ## aws_instance = modules; terraforminstance =  parameter
  value = aws_instance.terraforminstance.public_ip               ## public_ip := attribute you can modify as per your requirement
}


# after running terraform apply command , output will be visible on terminal itselft
  
