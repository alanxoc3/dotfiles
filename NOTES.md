# Idk. Some notes I guess.
I'll probably move this file somewhere else. I just need to make some notes.

## runbook
If himalaya complains about a cert error, I just need to restart dovecot on the server "sudo systsemctl restart dovecot". This is because the cert was probably updated automatically, dovecot still has the old cert cached though.

## 2023-05-17
Fleet is a solution that monitors git repos and does helm deploys when there are changes.

In kubernetes, labels are for kubernetes while annotations are for people. Labels also have stricter requirements than values.

In kubernetes, node affinity allows more flexibility than node selectors. Both are properties on a pod that attract the pod to a node. Taints are properties set on a node that can deny or discourage pods matching certain properties from running on the node.

## 2023-05-18
Theoretically, connecting to the chatgpt api is pretty easy in Python:

    # pip install openai
    import openai
    openai.api_key = "YOUR_OPENAI_API_KEY"
    openai.ChatCompletion.create(
      model="gpt-3.5-turbo",
      messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Who won the super bowl in 1973?"},
        {"role": "assistant", "content": "The Miami Dolphins won the Super Bowl in 1973."},
        {"role": "user", "content": "Where was it played?"}
      ]
    )

In YAML, you can reference a value by putting the reference before the value, eg:

    one: &ref "these are the same"
    two: *ref
