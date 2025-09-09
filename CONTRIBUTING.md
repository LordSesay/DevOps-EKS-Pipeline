# Contributing to DevOps EKS Pipeline

Thank you for your interest in contributing to this project! This document provides guidelines for contributing.

## 🤝 How to Contribute

### Reporting Issues
- Use GitHub Issues to report bugs or request features
- Provide detailed information about the issue
- Include steps to reproduce the problem
- Add relevant logs or error messages

### Submitting Changes
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Add tests if applicable
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## 📋 Development Guidelines

### Code Style
- Follow existing code formatting
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions small and focused

### Terraform
- Use consistent naming conventions
- Add descriptions to all variables
- Include appropriate tags on resources
- Follow security best practices

### Kubernetes
- Use resource limits and requests
- Implement health checks
- Follow security contexts
- Use meaningful labels and annotations

### Documentation
- Update README.md for significant changes
- Add inline comments for complex code
- Update architecture diagrams if needed
- Include examples in documentation

## 🧪 Testing

### Local Testing
```bash
# Test Terraform configuration
cd infrastructure
terraform validate
terraform plan

# Test application locally
cd application
npm install
npm test
npm start
```

### Integration Testing
- Test full deployment pipeline
- Verify application functionality
- Check monitoring and logging
- Validate security configurations

## 📝 Pull Request Process

1. Ensure your code follows the style guidelines
2. Update documentation as needed
3. Add tests for new functionality
4. Ensure all tests pass
5. Request review from maintainers

### PR Checklist
- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] Tests added/updated
- [ ] All checks passing

## 🏷️ Versioning

We use [Semantic Versioning](https://semver.org/):
- MAJOR: Breaking changes
- MINOR: New features (backward compatible)
- PATCH: Bug fixes (backward compatible)

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙋‍♂️ Questions?

Feel free to open an issue for any questions about contributing!