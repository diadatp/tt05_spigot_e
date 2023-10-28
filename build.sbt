ThisBuild / version := "1.0"
ThisBuild / scalaVersion := "2.12.16"
ThisBuild / organization := "com.diadatp"

val spinalVersion = "1.9.3"
val spinalCore = "com.github.spinalhdl" %% "spinalhdl-core" % spinalVersion
val spinalLib = "com.github.spinalhdl" %% "spinalhdl-lib" % spinalVersion
val spinalIdslPlugin = compilerPlugin("com.github.spinalhdl" %% "spinalhdl-idsl-plugin" % spinalVersion)

lazy val spigot_e = (project in file("."))
  .settings(
    Compile / scalaSource := baseDirectory.value / "src",
    libraryDependencies ++= Seq(spinalCore, spinalLib, spinalIdslPlugin)
  )

fork := true
