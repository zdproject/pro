package com.itheima.product.web.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import com.itheima.product.domain.Product;

/**
 * 閫氱敤瑙ｅ喅 get 鍜� post涔辩爜杩囨护鍣�
 * 
 * 
 * 
 */
public class EncodingFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		// 澶勭悊璇锋眰涔辩爜
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletRequest myRequest = new MyRequest(httpServletRequest);

		// 澶勭悊鍝嶅簲涔辩爜
		response.setContentType("text/html;charset=utf-8");

		chain.doFilter(myRequest, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}

}

// 鑷畾涔塺equest瀵硅薄
class MyRequest extends HttpServletRequestWrapper {

	private HttpServletRequest request;

	private boolean hasEncode;

	public MyRequest(HttpServletRequest request) {
		super(request);// super蹇呴』鍐�
		this.request = request;
	}

	// 瀵归渶瑕佸寮烘柟娉� 杩涜瑕嗙洊
	@Override
	public Map getParameterMap() {
		// 鍏堣幏寰楄姹傛柟寮�
		String method = request.getMethod();
		if (method.equalsIgnoreCase("post")) {
			// post璇锋眰
			try {
				// 澶勭悊post涔辩爜
				request.setCharacterEncoding("utf-8");
				return request.getParameterMap();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else if (method.equalsIgnoreCase("get")) {
			// get璇锋眰
			Map<String, String[]> parameterMap = request.getParameterMap();
			if (!hasEncode) { // 纭繚get鎵嬪姩缂栫爜閫昏緫鍙繍琛屼竴娆�
				for (String parameterName : parameterMap.keySet()) {
					String[] values = parameterMap.get(parameterName);
					if (values != null) {
						for (int i = 0; i < values.length; i++) {
							try {
								// 澶勭悊get涔辩爜
								values[i] = new String(values[i]
										.getBytes("ISO-8859-1"), "utf-8");
							} catch (UnsupportedEncodingException e) {
								e.printStackTrace();
							}
						}
					}
				}
				hasEncode = true;
			}
			return parameterMap;
		}

		return super.getParameterMap();
	}

	@Override
	public String getParameter(String name) {
		Map<String, String[]> parameterMap = getParameterMap();
		String[] values = parameterMap.get(name);
		if (values == null) {
			return null;
		}
		return values[0]; // 鍙栧洖鍙傛暟鐨勭涓�涓��
	}

	@Override
	public String[] getParameterValues(String name) {
		Map<String, String[]> parameterMap = getParameterMap();
		String[] values = parameterMap.get(name);
		return values;
	}

}
