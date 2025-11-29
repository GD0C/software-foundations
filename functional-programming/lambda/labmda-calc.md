
# Lambda calculus


### Legend
```
Increment: λn.λf.λx f (nfx)

zero: λf.λx.x One: λf.λx.fx
Two: λf.λx.f (fx)
Three: λf.λx.f (f (f x))


--- Idea ---
n = λf.λx.f^n(x)

```

Proof  Encoding = 1
```
λn.λf.λx f (nfx) (λf.λx.x)
⟹  λf.λx. f((λf.λx.x) f x)
⟹  λf.λx. f(f x) ⟺   One ∎
``` 
 
    

Proof Encoding = 3 





Variable = x
Function = λx.x   
Application = (λx.x)a   



SUCC = λn.λf.λx f (nfx) 
2 = (λf.λx.f (f x))


```Proof{SUCC 2 = 3}
λn.λf.λx f (nfx) (λf.λx.f (f x))
⟹   λf.λx.f ((λf.λx.f (f x)) f x)
⟹   λf.λx.f ((λg.λy.g (g y) f x)
⟹   λf.λx.f (f (f x)) ⟺  Three ∎
```

Proof Encoding = 4 
