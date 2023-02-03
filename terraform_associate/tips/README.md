## We can generate graph of terraform plan / code using graphivz 

### make sure you have graphviz installed your terraform machine 

### How to generate 

```
fire@ashutoshhs-MacBook-Air terraform % terraform graph | dot -Tsvg  >graph.svg
```

### graph explanation 

<img src=../images/graph.png>

