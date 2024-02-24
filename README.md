# zef_ddd_core

A comprehensive Dart library designed to facilitate the implementation of Domain-Driven Design (DDD) principles in your applications.
This library provides essential building blocks for modeling domain concepts, managing domain events, and ensuring effective communication between different parts of your domain model.

## Features

- Domain Event Management: A singleton DomainEventDispatcher for dispatching domain events to registered listeners, promoting effective domain event handling and decoupling.
- Domain Model Foundation: Base classes for AggregateRoot, Entity, Id, and ValueObject to accurately model your domain and ensure the integrity and consistency of your domain logic.
- Type-Safe Event Listeners: Generic DomainEventListener interface for handling specific types of domain events, allowing for clean and maintainable event handling logic.
- Immutability and Identity: Emphasis on immutability and entity identity to align with DDD principles and ensure that domain models are robust, consistent, and free of side effects.

## Getting Started

To incorporate this library into your project, start by adding the zef_ddd_core package to your pubspec.yaml file.

## Installation

```yaml
dependencies:
  zef_ddd_core: <latest_version>
```

Ensure to replace <latest_version> with the actual version number of the zef_ddd_core package.

## Usage

### Domain Event Dispatching

- Register Event Listeners:

```dart
DomainEventDispatcher.instance.registerListener<MyEvent>(myEventListener);
```

- Dispatch Events:

```dart
DomainEventDispatcher.instance.dispatch(myEventInstance);
```

- Unregister Event Listeners:

```dart
DomainEventDispatcher.instance.unregisterListener<MyEvent>(myEventListener);
```

### Domain Modeling

- Define Aggregate Roots and Entities: Extend AggregateRoot and Entity to model your domain aggregates and entities, providing a strong foundation for your domain logic.
- Implement Value Objects: Create value objects by extending ValueObject or SingleTypeValueObject to encapsulate values within your domain, ensuring validity and immutability.
- Use Custom Identifiers: Extend Id to define custom identifiers for your aggregates and entities, ensuring uniqueness and meaningful identity.

### Examples

Creating a Domain Event

```dart
class UserRegisteredEvent extends DomainEvent {
  final UserId userId;
  UserRegisteredEvent(this.userId);
}
```

Implementing an Event Listener

```dart
class MyEventListener implements DomainEventListener<UserRegisteredEvent> {
  @override
  Future<void> listen(UserRegisteredEvent event) async {
    // Event handling logic
  }
}
```

Defining an Id

```dart
class UserId extends Id<String> {
  UserId(super.value);
}
```

Defining an Aggregate Root

```dart
class User extends AggregateRoot<UserId> {
  final String name;
  User({required UserId id, required this.name}) : super(id: id);
}
```

## Contributing

We welcome contributions, including bug reports, feature requests, and code contributions. Feel free to submit pull requests or open issues to discuss potential improvements.
