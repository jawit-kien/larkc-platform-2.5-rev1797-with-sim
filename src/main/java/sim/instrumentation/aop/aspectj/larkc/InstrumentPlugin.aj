/*
 * This file is part of the LarKC platform http://www.larkc.eu/
 *
 *  Copyright 2010 LarKC project consortium
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package sim.instrumentation.aop.aspectj.larkc;

import org.openrdf.model.URI;

import eu.larkc.core.data.SetOfStatements;

import sim.instrumentation.aop.aspectj.AbstractMethodInstrumentation;

/**
 * @author mcq
 *
 */
public aspect InstrumentPlugin extends AbstractMethodInstrumentation {

	public pointcut methodsToInstrument(): within(eu.larkc.plugin.Plugin) && execution(* *(..)) && 
											! execution(public URI getIdentifier()) &&
											! execution(public SetOfStatements getPluginParameters()) &&
											! execution(public int getInputBehavior()) &&
											! execution(public void setInputBehavior(int)) &&
											! execution(private int extractInputBehavior(SetOfStatements)) &&
											! execution(protected SetOfStatements getInvocationKey(SetOfStatements)) &&
											! execution(protected SetOfStatements cacheLookup(SetOfStatements)) &&
											! execution(protected void cacheInsert(SetOfStatements, SetOfStatements)) &&
											! execution(protected URI getNamedGraphFromParameters(SetOfStatements, URI))
											;

}
