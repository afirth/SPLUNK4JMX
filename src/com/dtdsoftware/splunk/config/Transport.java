package com.dtdsoftware.splunk.config;

/**
 * POJO for Transport config
 * 
 * @author Damien Dallimore damien@dtdsoftware.com
 * 
 */
public class Transport extends ParameterizedConfig {

	// default transport implementation
	public final static String DEFAULT = "com.dtdsoftware.splunk.transport.StdOut";

	// class name of the transport implementation
	public String className = DEFAULT;

	public Transport() {
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	/**
	 * Obtain a transport instance via reflection
	 * 
	 * @return
	 * @throws Exception
	 */
	public com.dtdsoftware.splunk.transport.Transport getTransportInstance()
			throws Exception {

		com.dtdsoftware.splunk.transport.Transport obj = (com.dtdsoftware.splunk.transport.Transport) Class
				.forName(className).newInstance();
		obj.setParameters(this.getParameters());
		return obj;
	}

}