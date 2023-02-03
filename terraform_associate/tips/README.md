## We can generate graph of terraform plan / code using graphivz 

### make sure you have graphviz installed your terraform machine 

### How to generate 

```
fire@ashutoshhs-MacBook-Air terraform % terraform graph | dot -Tsvg  >graph.svg
```

### graph explanation 

<img src=../images/graph.png>


### terraform Best practises link by Terraform 

[click_here](https://www.terraform-best-practices.com/)

### Terraform format -- TO fix identations automatically 

```
terraform fmt
```

### terraform validate -- To let you know what is missing 

```
terraform validate
```



https://user-images.githubusercontent.com/8552914/216512889-b6d958c6-bb85-4e1e-bac6-a753757c6869.mp4



