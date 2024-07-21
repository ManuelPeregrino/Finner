import {
  Injectable,
  ConflictException,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './user.entity';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {}

  findAll(): Promise<User[]> {
    return this.userRepository.find({
      select: ['id', 'email', 'name', 'lastname'],
    });
  }

  findOneById(id: number): Promise<User> {
    return this.userRepository.findOne({
      where: { id },
      select: ['id', 'email', 'name', 'lastname'],
    });
  }

  findOneByEmail(email: string): Promise<User> {
    return this.userRepository.findOneBy({ email });
  }

  async create(user: User): Promise<User> {
    const hashedPassword = await bcrypt.hash(user.password, 10);
    const userWithHashedPassword = {
      ...user,
      password: hashedPassword,
    };

    try {
      return await this.userRepository.save(userWithHashedPassword);
    } catch (error) {
      if (error.code === 'ER_NO_DEFAULT_FOR_FIELD') {
        throw new ConflictException('Missing required field');
      } else if (error.code === 'ER_DUP_ENTRY') {
        throw new ConflictException('Email already exists');
      }
      throw error;
    }
  }

  async update(id: number, user: User): Promise<User> {
    if (user.password) {
      const hashedPassword = await bcrypt.hash(user.password, 10);
      user.password = hashedPassword;
    }

    try {
      await this.userRepository.update(id, user);
      return this.findOneById(id);
    } catch (error) {
      if (error.code === 'ER_NO_DEFAULT_FOR_FIELD') {
        throw new ConflictException('Missing required field');
      } else if (error.code === 'ER_DUP_ENTRY') {
        throw new ConflictException('Email already exists');
      }
      throw error;
    }
  }

  async remove(id: number): Promise<{ message: string }> {
    const result = await this.userRepository.delete(id);
    if (result.affected === 0) {
      throw new NotFoundException(`User with ID ${id} not found`);
    }
    return { message: `User with ID ${id} deleted successfully` };
  }
}
