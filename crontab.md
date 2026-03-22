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
