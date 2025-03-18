package org.springframework.samples.petclinic.chat;

import org.springframework.ai.chat.client.ChatClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Configuration
public class ChatConfigure {

    private static final Logger logger = LoggerFactory.getLogger(ChatConfigure.class);

    @Bean
    public ChatClient chatClient() {
        String endpoint = System.getenv("AZURE_OPENAI_ENDPOINT");
        String apiKey = System.getenv("AZURE_OPENAI_API_KEY");
        
        // Debug logging to verify the environment variables
        logger.info("AZURE_OPENAI_API_KEY: {}", apiKey);
        logger.info("AZURE_OPENAI_ENDPOINT: {}", endpoint);

        if (apiKey == null || apiKey.isEmpty()) {
            throw new IllegalArgumentException("AZURE_OPENAI_API_KEY environment variable is not set");
        }
        if (endpoint == null || endpoint.isEmpty()) {
            throw new IllegalArgumentException("AZURE_OPENAI_ENDPOINT environment variable is not set");
        }

        // return new ChatClient(endpoint, apiKey);
        return new ChatClient("https://open-ai-account-3537fb.openai.azure.com/", "efd6975f0ac847c0802479692e06a226");
    }
}