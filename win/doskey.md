
## 1. Create a file to store your macros (DOSKEYs)

```text
"C:\Programs\bin\macros.doskey"†
```

```

```doskey

ls=dir $* $T
up=cd.. $T
ex=exit $T
np=notepad
sysprops=systempropertiesadvanced

```

```

## 2. Go to the registry editor

### 2.1

```registry
HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\
```

### 2.2 Add Sub-Key

```
Right-click and add a new "String Value" sub-key. Name it Autorun.
Right-click -> New -> String Value
```

### 2.3 Add Value with doskey macros file

```
```text

Right-click it and Modify the Value data.
Right-click -> Modify -> Value data -> DOSKEY /MACROFILE="C:\Programs\bin\macros.doskey"

```
