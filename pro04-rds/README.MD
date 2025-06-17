1.[DONE] Understand the RDS resource and which necessary resources we need 
2.[DONE]  Creating a module with the standard structure
3. [DONE] Implement variable validation
4. Create the necessary resources and make the validation is working 
    4.1 receive subnet ids nad security groups ids via variable
    4.2 For subnets:
        4.2.1 Make sure that they are not in the default vpc 
        4.2.2 Make sure that they are private
        4.2.3 Check wheather they are tagged with access=private
    4.3
        4.3.1 Make sure that ther are not inboudn rules forIP addresses
5. create the necesary resources and make sure the validation is working
6. Create the rds instance inside the module 