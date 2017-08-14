specializations = [
    {
        doctor_title: 'Терапевт', clinic_title: 'Терапия',alias_name: 'therap'
    },
    {
        doctor_title: 'Педиатр', clinic_title: 'Педиатрия', alias_name: 'pediatr'
    },
    {
        doctor_title: 'Отоларинголог', clinic_title: 'Отоларингология', alias_name: 'otolaryngolog'
    },
    {
        doctor_title: 'Хирург', clinic_title: 'Хирургия', alias_name: 'surg'
    },
    {
        doctor_title: 'Невропатолог', clinic_title: 'Невропатология', alias_name: 'neuropatholog'
    },
    {
        doctor_title: 'Психолог', clinic_title: 'Психология', alias_name: 'psycholog'
    },
    {
        doctor_title: 'Ревматолог', clinic_title: 'Ревматология', alias_name: 'rheumatolog'
    },
    {
        doctor_title: 'Аллерголог', clinic_title: 'Аллергология', alias_name: 'allerg'
    },
    {
        doctor_title: 'Кардиолог', clinic_title: 'Кардиология', alias_name: 'cardio'
    },
    {
        doctor_title: 'Стоматолог', clinic_title: 'Стоматология', alias_name: 'dent'
    },
    {
        doctor_title: 'Подиатр', clinic_title: 'Подиатрия', alias_name: 'podiatr'
    },
    {
        doctor_title: 'Ортопед', clinic_title: 'Ортопедия', alias_name: 'orthoped'
    },
    {
        doctor_title: 'Офтальмолог', clinic_title: 'Офтальмология', alias_name: 'ophthalmolog'
    },
    {
        doctor_title: 'Гинеколог', clinic_title: 'Гинекология', alias_name: 'gynecolog'
    },
    {
        doctor_title: 'Андролог', clinic_title: 'Андрология', alias_name: 'androlog'
    },
    {
        doctor_title: 'Флеболог', clinic_title: 'Флебология', alias_name: 'phlebolog'
    }
]

specializations.each do |params|
  Specialization.create!(params)
end