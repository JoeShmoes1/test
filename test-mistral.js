// Simple test for Mistral AI API key
const apiKey = 'agKC6W5iUSPPpRSWYPmbUnBTqKiP75Zw';

async function testMistralAPI() {
  console.log('Testing Mistral AI API key...');
  
  try {
    const response = await fetch('https://api.mistral.ai/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${apiKey}`
      },
      body: JSON.stringify({
        model: 'mistral-tiny',
        messages: [
          {
            role: 'user',
            content: 'Hello, this is a test message. Please respond briefly.'
          }
        ],
        max_tokens: 50
      })
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();
    console.log('✅ Mistral AI API test successful!');
    console.log('Response:', data.choices[0].message.content);
    
  } catch (error) {
    console.error('❌ Mistral AI API test failed:', error.message);
  }
}

testMistralAPI();
