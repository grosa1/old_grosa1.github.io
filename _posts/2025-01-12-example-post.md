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

The Oracle Cloud Infrastructure, simply OCI, is one of the big cloud platforms currently available in the market together with AWS, Google Cloud, and Azure. Even if Oracle entered the cloud services business late, more and more customers worldwide are choosing the OCI platform. Among the historical Oracle products, such as the Oracle Autonomous Database, OCI has a rich offering in data science and AI services.

OCI Generative AI is a powerful platform for creating and deploying GenAI-powered apps. Specifically, it offers a range of powerful features designed to integrate Large Language Models (LLM) into various enterprise use cases. For example:

Customizable state-of-the-art Large Language Models (LLMs) for several tasks, such as text generation, summarization, and text embeddings. They can be Fine-Tuned with custom datasets to obtain custom models tailored to specific use cases. The currently available models include Llama models from Meta and Command R and R+ from Cohere.

Dedicated AI clusters for hosting customized LLMs, ensuring high availability and reliability for usage-intensive applications.

Integration with several open-source frameworks, such as LangChain and LlamaIndex, that allow to easily build context-augmented applications and retrieval-augmented generation (RAG) solutions.

Content moderation and controls applied to user-created endpoints for custom or pre-trained models with the autonomy to update, move, or delete them as needed.


## Getting started with OCI Generative AI

How to get started with OCI Generative AI services? Before getting hands-on with the code, there are several preliminary steps to achieve.

1. Creating an Account: visit the Oracle Cloud website and sign up for an account. You'll need to provide some basic information and verify your email address. Once your account is created, you can access the OCI Console.

2. Navigating the OCI Console: The OCI Console is your main interface for managing cloud resources. Familiarize yourself with the dashboard, where you can access various services, monitor usage, and configure settings. Specifically, the GenAI playground allows to easily experiment with the models hosted on OCI. To access the playground, go to ….

3. Creating an API key: After creating your account, you'll need to create an API key that is mandatory for the authentication to the OCI Generative AI service. To create an API key, go to …. In order to start using the OCI GenAI service on your pc, you must setup the API key by …