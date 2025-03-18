---
layout: post
title:  A gentle Introduction to OCI Generative AI services
date:   2025-01-12
description: example post description
tags: code
categories: sample-posts
---

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="/assets/img/cover1.jpeg" class="img-fluid rounded z-depth-1" %}
    </div>
</div>


## Introduction

This article aims to provide a comprehensive guide for beginners to get started with Oracle Cloud Infrastructure (OCI) Generative AI service. We'll cover everything from creating an account to setting up the environment and running your first AI tasks, starting with a brief overview of the main features.

The Oracle Cloud Infrastructure is one of the big cloud platforms currently available in the market together with AWS, Google Cloud, and Azure. 
Among the others, OCI offer several AI services, from the GPU infrastructure to AI-based services such as a powerful platform for creating and deploying GenAI-powered apps. 
OCI Generati AI includes a set of customizable state-of-the-art Large Language Models (LLMs) for several tasks, such as text generation, summarization, and text embeddings. They can be customized via Fine-Tuning on custom datasets, and also deployed in a dedicated AI cluster.
The currently available models include Llama models from Meta and Command R and R+ from Cohere, available via the [`oci-sdk`](https://github.com/oracle/oci-python-sdk) (for Python, Java, and Node.js) and also from serveral open-source frameworks such as LangChain and LlamaIndex.

Content moderation and controls applied to user-created endpoints for custom or pre-trained models with the autonomy to update, move, or delete them as needed.


## Getting started with OCI Generative AI

How to get started with OCI Generative AI services? Before getting hands-on with the code, there are several preliminary steps to achieve.

1. **Creating an Account**: visit the Oracle Cloud website and sign up for an account. You'll need to provide some basic information and verify your email address. Once your account is created, you can access the OCI Console.

2. **Navigating the OCI Console**: The OCI Console is your main interface for managing cloud resources. Familiarize yourself with the dashboard, where you can access various services, monitor usage, and configure settings. Specifically, the GenAI playground allows to easily experiment with the models hosted on OCI. To access the playground, go to ….

3. **Creating an API key**: After creating your account, you'll need to create an API key that is mandatory for the authentication to the OCI Generative AI service. To create an API key, go to …. In order to start using the OCI GenAI service on your pc, you must setup the API key by …


## Setting up the environment

The first step is to install the OCI SDK, which provides the necessary tools and libraries to interact with the OCI services. You can install the SDK using pip:

```bash
pip install oci
```

Next, you'll need to set up your configuration file, which contains the necessary information to authenticate with the OCI services. You can create a configuration file by running the following command:

```bash
oci setup config
```

Before running your first AI task, you'll need to set up the environment variables for the OCI GenAI service. You can do this by setting the following variables:

```bash
export OCI_CONFIG_FILE=~/.oci/config
export OCI_CONFIG_PROFILE=default
export OCI_REGION=us-ashburn-1
```

The next step is to set up a python environment and install the necessary libraries. You can create a virtual environment using the following commands:

```bash
python3 -m venv env
source env/bin/activate
```

Finally, you can install the required libraries using pip:

```bash
pip install oci
```

## Running your first AI task

Now that the setup is complete, we can run our first task using the OCI Generative AI service. In the following examples, we'll demonstrate how to use the oci-sdk, LangChain, and LlamaIndex to interact with the service and perform text generation tasks.

### 1. Using the `oci-sdk`:

```python
import oci
from oci.generative_ai_inference import GenerativeAiInferenceClient
from oci.generative_ai_inference.models import SystemMessage, UserMessage, AssistantMessage, CohereChatRequest, GenericChatRequest, ChatContent

# Initialize the OCI client
config = oci.config.from_file()
gen_ai_client = GenerativeAiInferenceClient(config, service_endpoint=endpoint)

messages = [
    SystemMessage(content="You are a helpful assistant."),
    UserMessage(content="Hello! How can you assist me today?"),
    AssistantMessage(content="Hi there! I can help you with information, tasks, and more. How can I help you today?")
]

chat_request = GenericChatRequest(
    api_format="GENERIC",
    messages=messages,
    is_stream=False,
    temperature=0.7,
    max_tokens=1000
)
# messages=[Message(role=msg["role"], content=msg["content"]) for msg in messages]

gen_ai_client.chat(chat_details=chat_request)

# response = gen_ai_client.create_chat_completion(create_chat_completion_details=chat_request)
# print(response.data.choices[0].message.content)
```

### 2. Using LangChain:

```python
from langchain_community.chat_models import ChatOCIGenAI

llm = ChatOCIGenAI(
    model_id="cohere.command-light",
    service_endpoint=endpoint,
    compartment_id="YOUR_OCI_COMPARTMENT_ID",
    model_kwargs={"temperature": 0.7, "max_tokens": 1000},
)

messages = [
    ("system", "You are a helpful translator. Translate the user sentence to French."),
    ("human", "I love programming."),
]

llm.invoke(messages)
```

### 3. Using LlamaIndex:

```python
from llama_index.llms.oci_genai import OCIGenAI
from llama_index.core.llms import ChatMessage

from llama_index.core import Settings
from llama_index.core.callbacks import CallbackManager
from langfuse.llama_index import LlamaIndexCallbackHandler
from dotenv import load_dotenv

load_dotenv()
 
langfuse_callback_handler = LlamaIndexCallbackHandler()
Settings.callback_manager = CallbackManager([langfuse_callback_handler])

common_oci_params = {
    "compartment_id": "YOUR_OCI_COMPARTMENT_ID",
    "max_tokens": 1000,
    "temperature": 0.7,
    # Inference endpoint for Europe (Frankfurt)
    "service_endpoint": "https://inference.generativeai.eu-frankfurt-1.oci.oraclecloud.com",
}

OCI_GEN_MODEL = "cohere.command-r-plus"
# OCI_GEN_MODEL = "meta.llama-3.1-70b-instruct"

# these are the name of the models used by OCI GenAI
# changed 04/06 when new models arrived
llm = OCIGenAI(auth_type="API_KEY", model=OCI_GEN_MODEL, **common_oci_params)

# Define an example conversation of a chatbot assistant
messages = [
    ChatMessage(role="system", content="You are a helpful assistant."),
    ChatMessage(role="user", content="Hello! How can you assist me today?")
]
```


## Conclusion

aaa