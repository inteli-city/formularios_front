import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/data/models/form_model.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

class FormMockRepository extends IFormRepository {
  var justificative = JustificativeEntity(
    options: [
      JustificativeOptionEntity(
        option: 'option',
        requiredImage: true,
        requiredText: true,
      ),
    ],
    selectedOption: null,
    text: null,
    image: null,
  );

  List<FormEntity> formList = [
    FormEntity(
      formTitle: 'Poda de Árvore',
      formId: 'ID1142342524242',
      creatorUserId: '1',
      userId: '1',
      vinculationFormId: '10',
      template: 'Poda de Árvore',
      area: 'area',
      system: 'Gaia',
      street: 'Rua Samuel Morse',
      city: 'São Paulo',
      number: 120,
      latitude: -23.61148,
      longitude: -46.69416,
      region: 'region',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.IN_PROGRESS,
      expirationDate: 1715000631000,
      creationDate: 1704561963000,
      startDate: 1,
      conclusionDate: 1,
      justificative: JustificativeEntity(
        options: [
          JustificativeOptionEntity(
            option: 'option',
            requiredImage: true,
            requiredText: true,
          ),
        ],
        selectedOption: null,
        text: null,
        image: null,
      ),
      comments: 'comments',
      sections: [
        SectionEntity(
          sectionId: 'section-01',
          fields: [
            FileFieldEntity(
                fileType: FileTypeEnum.DOCUMENT,
                minQuantity: 1,
                maxQuantity: 2,
                placeholder: 'FileField',
                key: 'key66',
                isRequired: true),
            TextFieldEntity(
              fieldType: FieldTypeEnum.TEXT_FIELD,
              placeholder: 'TextField 01',
              isRequired: true,
              key: 'key1',
            ),
            TextFieldEntity(
              fieldType: FieldTypeEnum.TEXT_FIELD,
              placeholder: 'TextField 02',
              isRequired: true,
              key: 'key2',
            ),
            NumberFieldEntity(
              fieldType: FieldTypeEnum.NUMBER_FIELD,
              placeholder: 'NumberField 01',
              isRequired: true,
              key: 'key3',
              decimal: false,
            ),
            DateFieldEntity(
              fieldType: FieldTypeEnum.DATE_FIELD,
              placeholder: 'DateField',
              isRequired: true,
              key: 'key33',
            ),
            RadioGroupFieldEntity(
                options: ['option1', 'option2'],
                placeholder: 'Radio Group',
                key: 'key44',
                isRequired: true),
            TypeAheadFieldEntity(
                options: ['option1', 'option2'],
                placeholder: 'TypeAhead',
                key: 'key55',
                isRequired: true),
          ],
        ),
        SectionEntity(
          sectionId: 'section-02',
          fields: [
            FileFieldEntity(
                fileType: FileTypeEnum.DOCUMENT,
                minQuantity: 1,
                maxQuantity: 2,
                placeholder: 'FileField',
                key: 'key77',
                isRequired: true),
          ],
        ),
        SectionEntity(
          sectionId: 'section-01',
          fields: [
            TextFieldEntity(
              fieldType: FieldTypeEnum.TEXT_FIELD,
              placeholder: 'placeholder',
              isRequired: true,
              key: 'key7',
            ),
            NumberFieldEntity(
              fieldType: FieldTypeEnum.NUMBER_FIELD,
              placeholder: 'placeholder',
              isRequired: true,
              key: 'key8',
              decimal: true,
            ),
            TextFieldEntity(
              fieldType: FieldTypeEnum.TEXT_FIELD,
              placeholder: 'placeholder',
              isRequired: true,
              key: 'key9',
            ),
          ],
        ),
      ],
      canVinculate: true,
    ),
    FormEntity(
      formTitle: 'Poda de Árvore 2',
      formId: 'ID1142342524243',
      creatorUserId: '1',
      userId: '1',
      vinculationFormId: null,
      template: 'Poda de Árvore 2',
      area: 'area',
      system: 'Gaia',
      street: 'Rua Samuel Morse 74',
      city: 'city',
      number: 1,
      latitude: 1.0,
      longitude: 1.0,
      region: 'region',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut purus elit, vestibulum ut, placerat ac, adipiscing vitae, felis.',
      priority: PriorityEnum.LOW,
      status: FormStatusEnum.NOT_STARTED,
      expirationDate: 1,
      creationDate: 1,
      startDate: 1,
      conclusionDate: 1,
      justificative: JustificativeEntity(
        options: [
          JustificativeOptionEntity(
            option: 'option',
            requiredImage: true,
            requiredText: true,
          ),
        ],
        selectedOption: null,
        text: null,
        image: null,
      ),
      comments: 'comments',
      sections: [],
      canVinculate: false,
    ),
    FormEntity(
      formTitle: 'Poda de Árvore 3',
      formId: 'ID1142342524244',
      creatorUserId: '1',
      userId: '1',
      vinculationFormId: null,
      template: 'Poda de Árvore 3',
      area: 'area',
      system: 'Gaia',
      street: 'Rua Samuel Morse 74',
      city: 'city',
      number: 1,
      latitude: 1.0,
      longitude: 1.0,
      region: 'region',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.CONCLUDED,
      expirationDate: 1,
      creationDate: 1,
      startDate: 1,
      conclusionDate: 1,
      justificative: JustificativeEntity(
        options: [
          JustificativeOptionEntity(
            option: 'option',
            requiredImage: true,
            requiredText: true,
          ),
        ],
        selectedOption: null,
        text: null,
        image: null,
      ),
      comments: 'comments',
      sections: [],
      canVinculate: true,
    ),
    FormEntity(
      formTitle: 'Poda de Árvore 4',
      formId: 'ID1142342524245',
      creatorUserId: '1',
      userId: '1',
      vinculationFormId: null,
      template: 'Poda de Árvore 4',
      area: 'area',
      system: 'Gaia',
      street: 'Rua Samuel Morse 74',
      city: 'city',
      number: 1,
      latitude: 1.0,
      longitude: 1.0,
      region: 'region',
      description: 'description',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.CANCELED,
      expirationDate: 1,
      creationDate: 1,
      startDate: 1,
      conclusionDate: 1,
      justificative: JustificativeEntity(
        options: [
          JustificativeOptionEntity(
            option: 'option',
            requiredImage: true,
            requiredText: true,
          ),
        ],
        selectedOption: null,
        text: null,
        image: null,
      ),
      comments: 'comments',
      sections: [],
      canVinculate: true,
    ),
    FormEntity(
      formTitle: 'Poda de Árvore 5',
      formId: 'ID1142342524246',
      creatorUserId: '2',
      userId: '1',
      vinculationFormId: null,
      template: 'Poda de Árvore 5',
      area: 'area',
      system: 'system',
      street: 'street',
      city: 'city',
      number: 1,
      latitude: 1.0,
      longitude: 1.0,
      region: 'region',
      description: 'description',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.NOT_STARTED,
      expirationDate: 1,
      creationDate: 1,
      startDate: 1,
      conclusionDate: 1,
      justificative: JustificativeEntity(
        options: [
          JustificativeOptionEntity(
            option: 'option',
            requiredImage: true,
            requiredText: true,
          ),
        ],
        selectedOption: null,
        text: null,
        image: null,
      ),
      comments: 'comments',
      sections: [],
      canVinculate: false,
    ),
    FormEntity(
      formTitle: 'Poda de Árvore 6',
      formId: 'ID1142342524247',
      creatorUserId: '2',
      userId: '1',
      vinculationFormId: null,
      template: 'Poda de Árvore 6',
      area: 'area',
      system: 'system',
      street: 'street',
      city: 'city',
      number: 1,
      latitude: 1.0,
      longitude: 1.0,
      region: 'region',
      description: 'description',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.NOT_STARTED,
      expirationDate: 1,
      creationDate: 1,
      startDate: 1,
      conclusionDate: 1,
      justificative: JustificativeEntity(
        options: [
          JustificativeOptionEntity(
            option: 'option',
            requiredImage: true,
            requiredText: true,
          ),
        ],
        selectedOption: null,
        text: null,
        image: null,
      ),
      comments: 'comments',
      sections: [],
      canVinculate: true,
    ),
    FormEntity(
      formId: 'ID1142342524248',
      creatorUserId: '4',
      userId: '2',
      vinculationFormId: null,
      template: 'Inspeção de PV',
      area: 'area',
      system: 'JUNDIAI',
      street: 'street',
      city: 'city',
      number: 1,
      latitude: 1.0,
      longitude: 1.0,
      region: 'region',
      description: 'description',
      priority: PriorityEnum.LOW,
      status: FormStatusEnum.NOT_STARTED,
      expirationDate: 1,
      creationDate: 1,
      startDate: 1,
      conclusionDate: 1,
      justificative: JustificativeEntity(
        options: [
          JustificativeOptionEntity(
            option: 'option',
            requiredImage: true,
            requiredText: true,
          ),
        ],
        selectedOption: null,
        text: null,
        image: null,
      ),
      comments: 'comments',
      sections: [],
      formTitle: 'Potencial de Vazamento',
      canVinculate: true,
    ),
    FormEntity(
      formTitle: 'Inspeção de PV 2',
      formId: 'ID1142342524249',
      creatorUserId: '5',
      userId: '2',
      vinculationFormId: null,
      template: 'PV',
      area: 'area',
      system: 'GAIA',
      street: 'street',
      city: 'city',
      number: 1,
      latitude: 1.0,
      longitude: 1.0,
      region: 'region',
      description: 'description',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.CONCLUDED,
      expirationDate: 1,
      creationDate: 1,
      startDate: 1,
      conclusionDate: 1,
      justificative: JustificativeEntity(
        options: [
          JustificativeOptionEntity(
            option: 'option',
            requiredImage: true,
            requiredText: true,
          ),
        ],
        selectedOption: null,
        text: null,
        image: null,
      ),
      comments: 'comments',
      sections: [],
      canVinculate: false,
    ),
  ];

  @override
  Future<Either<Failure, List<FormEntity>>> getUserForms(
      {required String userId}) async {
    await Future.delayed(const Duration(seconds: 1));

    return right(
      formList.where((element) => element.userId == userId).toList(),
    );
  }

  @override
  Future<Either<Failure, FormEntity>> updateFormStatus({
    required FormStatusEnum status,
    required String formId,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      int index = formList.indexWhere(
        (element) => element.formId == formId,
      );

      FormModel formModel = FormModel.entityToModel(formList[index]);

      FormModel copyFormModel = formModel.copyWith(status: status);

      formList.removeAt(index);

      formList.insert(index, copyFormModel);

      return right(copyFormModel);
    } catch (e) {
      return left(NoItemsFound(message: "Formulário não encontrado."));
    }
  }
}
