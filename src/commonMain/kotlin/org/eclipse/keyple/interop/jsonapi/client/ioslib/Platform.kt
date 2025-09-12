package org.eclipse.keyple.interop.jsonapi.client.ioslib

import io.github.aakira.napier.Antilog
import io.github.aakira.napier.DebugAntilog
import io.github.aakira.napier.Napier


class KeypleJsonApiLogs {
    companion object {
        fun napierEnableDebugLogs() {
            Napier.base(DebugAntilog())
        }

        fun napierEnableCustomLogger(logger: Antilog) {
            Napier.base(logger)
        }
    }
}