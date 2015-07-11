package com.cengze.util.auth;
import java.lang.annotation.*;

@Documented
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AuthPassport {
	boolean validate() default true;
	public String managertype() default "no";
}
