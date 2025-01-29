# API Testing Karate
==================
This repository contains the automation tests of this course:  [API testing with Karate](https://courses.testguild.com/course/karate2-joe-welcome/) .

What do I need to run?
---
A Java JDK, Maven and Karate. That's it!

✅ How I run the tests?
---

All the tests:

    mvn test

Tag tests:

    mvn clean test -Dkarate.options="--tags @getAll"


For the Karate template
Refer to the [Getting Started Guide](https://github.com/karatelabs/karate/wiki/Get-Started:-Maven-and-Gradle#github-template) for instructions.
