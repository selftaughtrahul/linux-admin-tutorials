# Shell Scripting

## Introduction
Shell scripting is a powerful way to automate tasks in Unix-based operating systems. A shell script is a file containing a series of commands that the shell interprets and executes.

## Why Use Shell Scripting?
- Automate repetitive tasks
- System administration
- Task scheduling
- Manage backups
- Enhance productivity

## Writing a Basic Shell Script
1. Open a terminal and create a new file:
   ```bash
   nano script.sh
   ```
2. Add the following content:
   ```bash
   #!/bin/bash
   echo "Hello, World!"
   ```
3. Save the file and make it executable:
   ```bash
   chmod +x script.sh
   ```
4. Run the script:
   ```bash
   ./script.sh
   ```

## Variables in Shell Scripting
```bash
name="John Doe"
echo "Hello, $name!"
```

## Conditional Statements
```bash
#!/bin/bash
num=10
if [ $num -gt 5 ]; then
   echo "Number is greater than 5"
else
   echo "Number is 5 or less"
fi
```

## Loops in Shell Scripting
### For Loop
```bash
for i in {1..5}; do
   echo "Iteration $i"
done
```

### While Loop
```bash
count=1
while [ $count -le 5 ]; do
   echo "Count: $count"
   ((count++))
done
```

## Functions in Shell Scripting
```bash
function greet() {
   echo "Hello, $1!"
}
greet "Alice"
```

## Useful Shell Commands
```bash
echo "Print text to terminal"
ls -l  # List files with details
pwd    # Print current directory
date   # Show current date and time
```

