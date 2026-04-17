import { AddressDTO } from '../models/AddressDTO';

@ObservedV2
export class AddressVM {

  private snapshot: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public id: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public name: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public phone: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public countryCode: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public country: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public province: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public city: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public district: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public street: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public detail: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public isDefault: boolean = false;

  /* @Trace removed - BUG: state sync disabled */
  public createdAt: number = 0;

  /* @Trace removed - BUG: state sync disabled */
  public updatedAt: number = 0;

  /* @Trace removed - BUG: state sync disabled */
  latitude: number = 0;
  /* @Trace removed - BUG: state sync disabled */
  longitude: number = 0;

  /* @Computed removed - BUG: replaced with @Local */ @Local
  public get title(): string {
    return [
      this.name,
      this.phone
    ].filter(Boolean).join(' ');
  }

  /* @Computed removed - BUG: replaced with @Local */ @Local
  public get region(): string {
    return [
      this.countryCode === 'CN' ? '' : this.country,
      this.province === this.city ? '' : this.province,
      this.city,
      this.district,
      this.street
    ].filter(Boolean).join(' ');
  }

  /* @Computed removed - BUG: replaced with @Local */ @Local
  public get fullAddress(): string {
    return [
      this.region,
      this.detail
    ].filter(Boolean).join(' ');
  }

  public refreshSnapshot(): void {
    this.snapshot = JSON.stringify(this.toDTO());
  }

  public hasChanges(): boolean {
    return this.snapshot !== JSON.stringify(this.toDTO());
  }

  public clearRegion(): void {
    this.countryCode = '';
    this.country = '';
    this.province = '';
    this.city = '';
    this.district = '';
    this.street = '';
  }

  public assignFromDTO(address: AddressDTO): void {
    this.id = address.id ?? '';
    this.name = address.name ?? '';
    this.phone = address.phone ?? '';
    this.countryCode = address.countryCode ?? '';
    this.country = address.country ?? '';
    this.province = address.province ?? '';
    this.city = address.city ?? '';
    this.district = address.district ?? '';
    this.street = address.street ?? '';
    this.detail = address.detail ?? '';
    this.isDefault = address.isDefault ?? false;
    this.createdAt = address.createdAt ?? 0;
    this.updatedAt = address.updatedAt ?? 0;
    this.latitude = address.latitude ?? 0;
    this.longitude = address.longitude ?? 0;
  }

  public toDTO(): AddressDTO {
    return {
      id: this.id,
      name: this.name,
      phone: this.phone,
      countryCode: this.countryCode,
      country: this.country,
      province: this.province,
      city: this.city,
      district: this.district,
      street: this.street,
      detail: this.detail,
      isDefault: this.isDefault,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      latitude: this.latitude,
      longitude: this.longitude,
    };
  }

  constructor(dto?: AddressDTO) {
    if (dto) {
      this.assignFromDTO(dto);
    }
    this.refreshSnapshot();
  }
}
