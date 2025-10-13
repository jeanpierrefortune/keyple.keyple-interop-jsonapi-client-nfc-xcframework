import org.jetbrains.kotlin.gradle.plugin.mpp.apple.XCFramework

///////////////////////////////////////////////////////////////////////////////
//  GRADLE CONFIGURATION
///////////////////////////////////////////////////////////////////////////////

plugins {
  alias(libs.plugins.kotlinMultiplatform)
  alias(libs.plugins.kotlinSerialization)
  alias(libs.plugins.spotless)
}

///////////////////////////////////////////////////////////////////////////////
//  APP CONFIGURATION
///////////////////////////////////////////////////////////////////////////////

kotlin {
  if (System.getProperty("os.name").lowercase().contains("mac")) {
    val xcframeworkName = rootProject.name

    val xcf = XCFramework(xcframeworkName)

    listOf(iosX64(), iosArm64(), iosSimulatorArm64()).forEach { iosTarget ->
      iosTarget.binaries.framework {
        baseName = xcframeworkName
        isStatic = true
        xcf.add(this)
        export(libs.keypleInteropJsonapiClientKmpLib)
        export(libs.keypleInteropLocalreaderNfcmobileKmpLib)
        // Configure Info.plist
        binaryOption("bundleId", "org.eclipse.keyple.$xcframeworkName")
        binaryOption("bundleVersion", "2")
        binaryOption("bundleShortVersionString", version.toString())
      }
    }
  }

  sourceSets {
    commonMain {
      dependencies {
        implementation(libs.kotlin.stdlib)
        implementation(libs.napier)
        implementation(libs.keypleInteropJsonapiClientKmpLib)
        implementation(libs.keypleInteropLocalreaderNfcmobileKmpLib)
      }
    }

    if (System.getProperty("os.name").lowercase().contains("mac")) {
      iosMain {
        dependencies {
          api(libs.keypleInteropJsonapiClientKmpLib)
          api(libs.keypleInteropLocalreaderNfcmobileKmpLib)
        }
      }
    }
  }
}

///////////////////////////////////////////////////////////////////////////////
//  STANDARD CONFIGURATION FOR KOTLIN-LIB MULTIPLATFORM PROJECTS
///////////////////////////////////////////////////////////////////////////////

tasks {
  spotless {
    kotlin {
      target("src/**/*.kt")
      licenseHeaderFile("${project.rootDir}/LICENSE_HEADER")
      ktfmt()
    }
    kotlinGradle {
      target("**/*.kts")
      ktfmt()
    }
  }
}
