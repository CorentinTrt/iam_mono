# Naming

Heavely inspired by [Stepan's work](https://stepan.wtf/cloud-naming-convention/)

## Resources

```
[resource]-[env]-[description]-[location]-[suffix]
```

| Key           | Description                                             | Regex               |
| ------------- | ------------------------------------------------------- | ------------------- |
| `resource`    | An abreviation of the resource type                     | `len 3-4, a-z`      |
| `env`         | Environment in which the SA is used                     | `enum: d \| s \| p` |
| `description` | A description to distinguish similar resources          | `len 4-8, a-z`      |
| `location`    | The location of the resource                            | `len 1-6, a-z0-9`   |
| `suffix`      | A unique ID used for readability and enforce uniqueness | `len 4, a-z0-9`     |

### Resource

An abreviation of the resource type. For GCP, we can use 3 to 4 letters abraviations.

_e.g:_

- _`cin` for **Compute Engine Instance**_
- _`wifp` for **Workload Identity Federation Pool**_

### Env

_e.g:_

- _`d` for **Development**_
- _`s` for **Staging**_
- _`p` for **Production**_

### Description

An additional description used give more context and help distinguishing similar resources.

_e.g:_

- _`ghpool` for **Github Pool**_
- _`backend` for **Back-end**_

### Location

The location of the resource.

_e.g:_

- _`euwe1` for **europe-west1**_
- _`nane1` for **northamerica-northeast1**_
- _`euwe1a` for **europe-west1 zone-a**_
- _`eu` for **europe multi region**_
- _`g` for **global**_

### Suffix

A unique suffix randomly generated to help reusability and uniqueness.

## Service Accounts (6 to 30)

```
[resource]-[env]-[target]-[action]-[suffix]
```

| Key           | Description                                             | Regex               |
| ------------- | ------------------------------------------------------- | ------------------- |
| `resource`    | Fixed Service Account prefix                            | `sa`                |
| `env`         | Environment in which the SA is used                     | `enum: d \| s \| p` |
| `target`      | Resource on which the SA have right on                  | `len 3-4, a-z`      |
| `action`      | The action that the SA is made to perform               | `len 4-8, a-z`      |
| `description` | A description to distinguish similar resources          | `len 4-8, a-z`      |
| `suffix`      | A unique ID used for readability and enforce uniqueness | `len 4, a-z0-9`     |

### Resource

An abreviation of the resource type. It's fixed for Service Account.

### Env

_e.g:_

- _`d` for **Development**_
- _`s` for **Staging**_
- _`p` for **Production**_

### Target

An abreviation of the resource type the SA have right one. For GCP, we can use 3 to 4 letters abraviations.

_e.g:_

- _`cin` for **Compute Engine Instance**_
- _`wifp` for **Workload Identity Federation Pool**_
- _`afr` for **Artifact Registry**_

### Action

The action that the SA is made to perform.

_e.g:_

- _`writer` for **For write purposes**_

### Description (optional)

An additional description used give more context and help distinguishing similar resources.

_e.g:_

- _`ghpool` for **Github Pool**_
- _`backends` for **Back-end**_
- _`bffs` for **Back For Fronts**_

### Suffix

A unique suffix randomly generated to help reusability and uniqueness.
