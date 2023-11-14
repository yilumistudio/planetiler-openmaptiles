## Maven tips

Maven is a widely used build automation and project management tool in the world of Java development.

### Video tutorial

www.youtube.com/watch?v=Xatr8AZLOsE

### How to install Maven

There are two ways:

- Install on local machine, this will result a global maven. Refer to official Maven site for installation.
- Use Maven wrapper which will be available to all users who sync this repo.
  To create a Maven wrapper in your repo, just run:

  ```
  # in project repo root
  mvn wrapper:wrapper
  ```

  This will create two files in project root: **mvnw** and **mvnw.cmd**, the first is for linux and the latter is for
  Windows.
  With Maven wrapper added to repo (just run once when setting up the repo), other developers who sync the repo will
  have the same specific maven version without install their own local maven.

  You can run `mvmw.cmd -v` to check.

### pom.xml

**Project Object Model (POM)**: Maven uses an XML file (pom.xml) to describe the project configuration, dependencies,
build
order, directories, required plugins, and other aspects. This file serves as the blueprint for the project.

1. `<groupId>`: e.g. com.yilumi.sgmap
2. `<artifactId>`: e.g. planetiler
3. `<plugins>`
4. `<dependency>`: if add <scope>test</scope>, this dependency will only for testing. It will not be included during
   compile.
   Once `<dependency>` is changed, IDE like IntellJ IDEA will re-download the dependencies.
   See all dependencies in IntellJ IDEA's **External Libraries** in right outline panel.
   In IntellJ IDEA, when pom.xml is open, type **alt + Insert**, will be able to search for dependencies. Or search
   in https://central.sonatype.com/?smo=true.
5. `<packaging>pom</packaging>`: When <packaging> is set to **pom**, it indicates that the project is a parent project
   or a
   multi-module project, and its primary artifact is the Project Object Model (POM) file itself, rather than a compiled
   artifact like a JAR or WAR file.
   This project's dependency **planetiler** is such a parent project.

### Maven repository

link: https://central.sonatype.com/?smo=true

### Useful commands

1. ```mvmw.cmd validate```
2. ```mvmw.cmd clean```: delete the generated **target** folder.
3. ```mvmw.cmd compile```: compile src/main into target/*.
4. ```mvmw.cmd test```: include compile, testcompile, then run tests.
5. ```mvmw.cmd package```: include compile, test, then run package.
6. ```mvmw.cmd install```: include package, then install to local maven repository.

### Project folder structure

```
src/main/java
src/main/resources # for resources other than java code

src/test/java
src/test/resources # testing resources
```

