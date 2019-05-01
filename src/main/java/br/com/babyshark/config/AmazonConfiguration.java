package br.com.babyshark.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

@Configuration
public class AmazonConfiguration {

	private static final String ACCESS_KEY = "AKIA2YJ7CXOSPHPN4UHC";

	private static final String SECRET_KEY = "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";

	private static final String REGION = "us-east-1";

	@Bean
	public AWSCredentials credential() {

		return new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);

	}

	@Bean
	public AmazonS3 s3Client() {

		return AmazonS3ClientBuilder.standard().withRegion(REGION)

				.withCredentials(new AWSStaticCredentialsProvider(credential())).build();

	}
}