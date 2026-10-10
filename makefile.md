# Makefile: derive it, don't memorize it

## Core rule
**A target's dependencies = every file its command reads.**

```
gcc -c mylib.c -o mylib.o      →  mylib.o: mylib.c mylib.h
ar rcs libmylib.a mylib.o      →  libmylib.a: mylib.o
gcc main.c libmylib.a -o app   →  app: main.c libmylib.a
```

## Exam method
1. **Write the manual gcc commands first** and get them working in the terminal.
2. **Wrap each command in a rule:** output before the colon, inputs after, command below with a TAB.
3. **Add `all:`** (lists the final executables) and **`clean:`** (`rm -f ...`).

## Build pipeline
```
.c  →  .o  →  library (.a / .so)  →  executable
```
Each arrow is one rule. Dependencies point to the left.

## The 7 flags
| Flag | When |
|---|---|
| `-Wall -g` | always |
| `-c` | compile to `.o` only |
| `-fPIC` | `.o` going into a `.so` |
| `-shared` | making the `.so` |
| `-I dir` | headers location |
| `-L dir` | libraries location |
| `-l name` | link `libname` |

**Question hints:** non-standard location → `-I` + `-L`; shared lib → `-fPIC` + `-shared`; system lib → just `-l`.

## Variables
```make
CC = gcc
CFLAGS = -Wall -g
```
Commands start with `$(CC) $(CFLAGS)`.

## Shortcuts
- `make -n` previews commands without running them.
- `$@` = target, `$<` = first dependency, `$^` = all dependencies.
- Rule not rebuilding? You probably forgot the `.h` dependency.
- "missing separator" means spaces instead of a TAB.

