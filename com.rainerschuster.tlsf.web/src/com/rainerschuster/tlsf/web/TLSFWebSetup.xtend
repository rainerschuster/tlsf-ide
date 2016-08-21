/*
 * generated by Xtext 2.10.0
 */
package com.rainerschuster.tlsf.web

import com.google.inject.Guice
import com.google.inject.Injector
import com.google.inject.Provider
import com.google.inject.util.Modules
import com.rainerschuster.tlsf.TLSFRuntimeModule
import com.rainerschuster.tlsf.TLSFStandaloneSetup
import java.util.concurrent.ExecutorService
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor

/**
 * Initialization support for running Xtext languages in web applications.
 */
@FinalFieldsConstructor
class TLSFWebSetup extends TLSFStandaloneSetup {
	
	val Provider<ExecutorService> executorServiceProvider;
	
	override Injector createInjector() {
		val runtimeModule = new TLSFRuntimeModule()
		val webModule = new TLSFWebModule(executorServiceProvider)
		return Guice.createInjector(Modules.override(runtimeModule).with(webModule))
	}
	
}
