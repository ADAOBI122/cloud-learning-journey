# 🐚 Bash Scripting – Complete Beginner Guide

## 📌 What is Bash?

**Bash (Bourne Again Shell)** is a command-line interpreter used in Linux and Unix systems.

It allows you to:

* Run commands
* Automate tasks
* Write scripts (like mini programs)

Think of Bash as a way to **talk to your computer using text commands**.

---

## 📜 What is a Bash Script?

A **Bash script** is a file that contains a series of commands that the computer will execute automatically.

Example:

```bash
#!/bin/bash
echo "Hello, World!"
```

---

## ⚙️ Basic Structure of a Bash Script

### 1. Shebang (VERY IMPORTANT)

```bash
#!/bin/bash
```

This tells the system to use Bash to run the script.

---

### 2. Comments

```bash
# This is a comment
```

Comments are ignored by the computer and used for explanation.

---

### 3. Commands

```bash
echo "This prints text"
date
```

---

## ▶️ How to Create and Run a Script

### Step 1: Create a file

```bash
nano script.sh
```

### Step 2: Add content

```bash
#!/bin/bash
echo "My first script"
```

### Step 3: Make it executable

```bash
chmod +x script.sh
```

### Step 4: Run it

```bash
./script.sh
```

---

## 🧠 Variables in Bash

Variables store values.

```bash
name="Ada"
echo "Hello $name"
```

Output:

```
Hello Ada
```

⚠️ No spaces around `=`!

---

## 🔀 Conditional Statements (if)

```bash
#!/bin/bash

number=10

if [ $number -gt 5 ]; then
  echo "Number is greater than 5"
else
  echo "Number is 5 or less"
fi
```

---

## 🔁 Loops

### For Loop

```bash
for i in 1 2 3
do
  echo "Number $i"
done
```

---

### While Loop

```bash
count=1

while [ $count -le 3 ]
do
  echo "Count: $count"
  ((count++))
done
```

---

## 📥 User Input

```bash
echo "Enter your name:"
read name
echo "Hello $name"
```

---

## 📂 Working with Files

### Create a file

```bash
touch file.txt
```

### Check if file exists

```bash
if [ -f file.txt ]; then
  echo "File exists"
fi
```

---

## 📤 Redirecting Output

### Save output to file

```bash
echo "Hello" > file.txt
```

### Append to file

```bash
echo "World" >> file.txt
```

---

## ⚠️ Common Mistakes

* Forgetting `chmod +x`
* Wrong file path
* Missing `#!/bin/bash`
* Spaces in variables (`name = Ada` ❌)

---

## ⏰ Bash + Crontab (Power Combo)

You can automate your Bash scripts using cron jobs.

Example:

```bash
* * * * * /home/user/script.sh
```

This runs your script every minute.

---

## 🧪 Debugging Tips

Run script with debug mode:

```bash
bash -x script.sh
```

---

## 🎯 Real-World Use Cases

* Backup files automatically
* Monitor system health
* Deploy applications
* Automate repetitive tasks
* Schedule jobs with cron

---

## 🚀 Summary

* Bash = command-line language
* Script = file with commands
* Used for automation
* Works perfectly with cron jobs

---

## 💡 Final Tip

Start simple, then build complex scripts over time. Bash is a **core DevOps skill**












# 🕒 Crontab (Cron Jobs) – Beginner Friendly Guide

## 📌 What is Crontab?

Crontab is a tool in Linux/Unix that lets your computer run tasks automatically at specific times or intervals.

Think of it like an alarm clock ⏰ for your computer:
- "Run this script every day at 8am"
- "Backup files every Sunday"
- "Check something every 5 minutes"

---

## ⚙️ What is a Cron Job?

A **cron job** is simply a scheduled task.

Example:
- Automatically delete old files
- Send reports
- Run scripts

---

## 🧠 How Crontab Works

Crontab uses a time format made of 5 parts:
* * * * *      command_to_run
| | | | |
| | | | └── Day of week (0 - 7) (Sunday = 0 or 7)
| | | └──── Month (1 - 12)
| | └────── Day of month (1 - 31)
| └──────── Hour (0 - 23)
└────────── Minute (0 - 59)


---

## 🧾 Examples

### Run a script every day at 8:00 AM 

0 8 * * * /path/to/script.sh


### Run every 5 minutes

*/5 * * * * /path/to/script.sh


### Run every Sunday at midnight

0 0 * * 0 /path/to/script.sh


---

## 🛠️ How to Use Crontab

### 1. Open crontab

crontab -e


### 2. Add a job
Example:

*/2 * * * * /home/user/test.sh


This runs every 2 minutes.

---

### 3. Save and exit
- If using nano: Press `CTRL + o`, then `Y`, then `Enter`and `CTRL + X` to exit .

---

## 📋 View Your Cron Jobs


crontab -l


---

## ❌ Remove All Cron Jobs


crontab -r


⚠️ Warning: This deletes everything!

---

## 🧪 Testing Tip

Always test your script manually first:


 ./script.sh


---

## ⚠️ Common Mistakes

- Wrong file path ❌
- Script not executable ❌
- Missing permissions ❌

Fix permission:

chmod +x script.sh


---

## 📁 Log Output (Important!)

To see what your job is doing:

/path/to/script.sh >> /path/to/log.txt 2>&1

This saves output and errors to a file.

---

## 🎯 Summary

- Crontab = scheduler
- Cron job = task
- Uses time format (* * * * *)
- Automates repetitive work

---

## 🚀 You're Ready!

Now you can automate tasks like a pro .
