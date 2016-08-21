/*
 * generated by Xtext 2.10.0
 */
package com.rainerschuster.tlsf.idea

import com.google.inject.Guice
import com.rainerschuster.tlsf.TLSFRuntimeModule
import com.rainerschuster.tlsf.TLSFStandaloneSetupGenerated
import org.eclipse.xtext.util.Modules2

class TLSFStandaloneSetupIdea extends TLSFStandaloneSetupGenerated {
	override createInjector() {
		val runtimeModule = new TLSFRuntimeModule()
		val ideaModule = new TLSFIdeaModule()
		val mergedModule = Modules2.mixin(runtimeModule, ideaModule)
		return Guice.createInjector(mergedModule)
	}
}
