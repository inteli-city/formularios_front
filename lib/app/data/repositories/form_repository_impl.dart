import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/data/datasources/form_datasource.dart';
import 'package:formularios_front/app/data/datasources/form_local_datasource.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

class FormRepositoryImpl extends IFormRepository {
  final IFormDatasource _formDatasource;
  final IFormLocalDatasource _localDatasource;
  FormRepositoryImpl(this._formDatasource, this._localDatasource);

  @override
  Future<Either<Failure, List<FormEntity>>> getUserForms() async {
    try {
      final result = await _formDatasource.getUserForms();

      await _localDatasource.saveForms(forms: result);

      if (result.isEmpty) {
        return Left(NoDataFound());
      }

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<FormEntity>>> getUserFormsLocally() async {
    try {
      return Right(await _localDatasource.getForms());
    } catch (e) {
      return left(LocalStorageFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FormEntity>> postForm(
      {required String formId,
      required List<SectionEntity> sections,
      String? vinculationFormId}) async {
    try {
      final result =
          await _formDatasource.postForm(formId: formId, sections: sections);

      await _localDatasource.updateForm(form: result);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, FormEntity>> updateFormLocally({
    required FormEntity form,
  }) async {
    try {
      await _localDatasource.updateForm(form: form);
      return Right(form);
    } catch (e) {
      return left(LocalStorageFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FormEntity>> updateFormStatus(
      {required FormStatusEnum status, required String formId}) async {
    try {
      final result = await _formDatasource.updateFormStatus(
        formId: formId,
        status: status,
      );

      await _localDatasource.updateForm(form: result);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, FormEntity>> createForm(
      {required FormEntity form}) async {
    try {
      final result = await _formDatasource.createForm(form: form);

      await _localDatasource.addForm(form: result);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(stackTrace: stackTrace));
    }
  }
}
