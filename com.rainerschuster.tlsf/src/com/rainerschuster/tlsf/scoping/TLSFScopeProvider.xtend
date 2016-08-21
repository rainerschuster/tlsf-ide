/*
 * generated by Xtext 2.10.0
 */
package com.rainerschuster.tlsf.scoping

import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import com.rainerschuster.tlsf.tLSF.ReferenceLiteral
import org.eclipse.xtext.EcoreUtil2
import com.rainerschuster.tlsf.tLSF.IdentifiableElement
import org.eclipse.xtext.scoping.Scopes

/**
 * This class contains custom scoping description.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#scoping
 * on how and when to use it.
 */
class TLSFScopeProvider extends AbstractTLSFScopeProvider {

	override getScope(EObject context, EReference reference) {
		// We want to define the Scope for the Element's superElement cross-reference
	    if (context instanceof ReferenceLiteral) {
	        // Collect a list of candidates by going through the model
	        // EcoreUtil2 provides useful functionality to do that
	        // For example searching for all elements within the root Object's tree
	        val rootElement = EcoreUtil2.getRootContainer(context)
	        val candidates = EcoreUtil2.getAllContentsOfType(rootElement, IdentifiableElement)
	        // Create IEObjectDescriptions and puts them into an IScope instance
	        return Scopes.scopeFor(candidates)
	    }
	    return super.getScope(context, reference);
	}
}