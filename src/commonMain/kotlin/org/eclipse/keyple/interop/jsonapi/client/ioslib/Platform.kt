/* **************************************************************************************
 * Copyright (c) 2025 Calypso Networks Association https://calypsonet.org/
 *
 * See the NOTICE file(s) distributed with this work for additional information
 * regarding copyright ownership.
 *
 * This program and the accompanying materials are made available under the terms of the
 * Eclipse Public License 2.0 which is available at http://www.eclipse.org/legal/epl-2.0
 *
 * SPDX-License-Identifier: EPL-2.0
 ************************************************************************************** */
package org.eclipse.keyple.interop.jsonapi.client.ioslib

import io.github.aakira.napier.Antilog
import io.github.aakira.napier.DebugAntilog
import io.github.aakira.napier.Napier

/**
 * Provides utility methods to configure logging for the Keyple JSON API using the Napier logging
 * library.
 *
 * This class includes methods for enabling debug logs and for setting a custom logger.
 *
 * @since 1.0.0
 */
class KeypleJsonApiLogs {
  companion object {
    /**
     * Enables debug logging using the Napier logging library.
     *
     * This method configures Napier to use the `DebugAntilog` implementation, which logs debug
     * messages to the standard output. It is typically used during development to track and
     * diagnose issues by displaying detailed log information.
     *
     * @since 1.0.0
     */
    fun napierEnableDebugLogs() {
      Napier.base(DebugAntilog())
    }

    /**
     * Configures Napier to use a custom logging implementation.
     *
     * This method allows you to specify a custom `Antilog` implementation to be used as the base
     * logger for Napier. It can be used to integrate your own logging framework or implement
     * customized log behavior.
     *
     * @param logger The custom `Antilog` implementation to be set as the base logger for Napier.
     * @since 1.0.0
     */
    fun napierEnableCustomLogger(logger: Antilog) {
      Napier.base(logger)
    }
  }
}
