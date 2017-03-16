package com.faisal.board.security;

import java.util.Collection;

import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

public class IpAddressVoter implements AccessDecisionVoter {

	public static final String IP_PREFIX = "IP_";
	public static final String IP_LOCAL_HOST = "IP_LOCAL_HOST";

	@Override
	public boolean supports(ConfigAttribute attribute) {
		return (attribute.getAttribute() != null) && attribute.getAttribute().startsWith(IP_PREFIX);
	}

	@Override
	public boolean supports(Class clazz) {
		return true;
	}

	@Override
	public int vote(Authentication authentication, Object object, Collection<ConfigAttribute> attributes) {
		if(!(authentication.getDetails() instanceof WebAuthenticationDetails)){
			return ACCESS_DENIED;
		}
		WebAuthenticationDetails details=(WebAuthenticationDetails)authentication.getDetails();
		String address=details.getRemoteAddress();
		
		int result=ACCESS_ABSTAIN;
		
		for(ConfigAttribute config:attributes){
			result=ACCESS_DENIED;
			
			if(IP_LOCAL_HOST.equals(config.getAttribute())){
				if(address.equals("127.0.0.1") || address.equals("0:0:0:0:0:0:0:1")){
					return ACCESS_GRANTED;
				}
			}
		}
		return result;
	}

}
