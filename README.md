# learning-center-management
This is a bash script driven learning center management system that collects information of services used at learning/tutoring centers.  This information then may be used for optimal allocation of resources (tutors).  This repository holds the bare-minimum of code that was presented at IEEE FIE 2018.

**Please** head to the [Wiki page](https://github.com/dnaneet/learning-center-management/wiki) if you wish to see this program in action.

**Main Script**
main2.sh is the main script and calls 24.sh in an "infinite loop" until SIGINT.

**SIGINT and Password to quit program**
The SIGINT command for this program is ctrl+g.  The password to quit the program is "fie2018" without the quotes.  This passworkd may be changed inside the file main2.sh
